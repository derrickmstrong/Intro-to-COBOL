       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    customerreport.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 8th 2020
ENVIRONMENT DIVISION.
*> Must add INPUT-OUTPUT section and FILE-CONTROL to work with files
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       *> Define file to send report
       SELECT CustomerReport ASSIGN TO "CustReport.rpt"
           ORGANIZATION IS LINE SEQUENTIAL.
       *> Assign CustomerFile name to Customer.dat file
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           *> Each line is going to take its own line
           ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
*> Define the Customer Report
FD CustomerReport.
01 PrintLine PIC X(44).

*> Describe the file layout
FD CustomerFile.
*> Design Customer record
01 CustomerData.
       02 IDNum    PIC 9(8).
       02 CustName.
           03 FirstName PIC X(15).
           03 LastName PIC X(15).
       *> Define End of file
       88 WSEOF VALUE HIGH-VALUE.

WORKING-STORAGE SECTION.
01 PageHeading.
       *> You use FILLER whenever you don't need to identify labels
       02 FILLER PIC X(13) VALUE "Customer List".
01 PageFooting.
       02 FILLER PIC X(15) VALUE SPACE.
       02 FILLER PIC X(7) VALUE "Page: ".
       02 PrnPageNum PIC Z9.
01 Heads PIC X(36) VALUE " IDNum    FirstName        LastName".
01 CustomerDetailLine.
       02 FILLER PIC X VALUE SPACE.
       02 PrnCustID PIC 9(5).
       02 FILLER PIC X(4) VALUE SPACE.
       02 PrnFirstName PIC X(15).
       02 FILLER PIC X(2) VALUE SPACE.
       02 PrnLastName PIC X(15).
01 ReportFooting PIC X(13) VALUE "END OF REPORT".
01 LineCount PIC 99 VALUE ZERO.
       88 NewPageRequired VALUE 40 THRU 99.
01 PageCount PIC 99 VALUE ZERO.

PROCEDURE DIVISION.
*> INPUT to read to file
OPEN INPUT CustomerFile.
*> OUTPUT to write to file
OPEN OUTPUT CustomerReport.
*> 
PERFORM PrintPageHeading 
READ CustomerFile
       AT END SET WSEOF TO TRUE
END-READ
PERFORM PrintReportBody UNTIL WSEOF
WRITE PrintLine FROM ReportFooting AFTER ADVANCING 5 LINES.
CLOSE CustomerFile, CustomerReport.
STOP RUN.

*> CREATE PARAGRAPHS
PrintPageHeading.
       WRITE PrintLine FROM PageHeading AFTER ADVANCING Page
       WRITE PrintLine FROM Heads AFTER ADVANCING 5 LINES
       MOVE 3 TO LineCount
       ADD 1 TO PageCount.

PrintReportBody.
       IF NewPageRequired
           MOVE PageCount TO PrnPageNum
           WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES
           PERFORM PrintPageHeading
       END-IF
       MOVE IDNum TO PrnCustID
       MOVE FirstName to PrnFirstName
       MOVE LastName to PrnLastName
       WRITE PrintLine FROM CustomerDetailLine AFTER ADVANCING 1 LINE
       ADD 1 TO LineCount
       READ CustomerFile
           AT END SET WSEOF TO TRUE
       END-READ.
