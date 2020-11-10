       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    createtables.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 10th 2020
ENVIRONMENT DIVISION.

DATA DIVISION.

WORKING-STORAGE SECTION.
*> Subscripts
01 Table1.
       *> OCCURS in this case means I will have 4 Friend variables (Friend(1), Friend(2), Friend(3), Friend(4) ), each with 15 letters
       02 Friend PIC X(15) OCCURS 4 TIMES.
*> Multi-dimensional Table
01 CustTable.
       02 CustName OCCURS 5 TIMES.
           03 FName PIC X(10).
           03 LName PIC X(10).
*> Index Table - Declare subscript inside table
01 OrderTable
       02 Product OCCURS 2 TIMES INDEXED BY I.
           03 Prod


PROCEDURE DIVISION.
MOVE "Summer" TO Friend(1).
MOVE "Autumn" TO Friend(2).
*> Display Friend subscript 1
DISPLAY Friend(1).
*> Diplay Table1
DISPLAY Table1.

MOVE "Winter" TO FName(1).
MOVE "Gayla" TO LName(1).
MOVE "Summer" TO FName(2).
MOVE "Gayla" TO LName(2).
*> Display CustName subscript 1
DISPLAY CustName(1).
*> Diplay CustTable
DISPLAY CustTable.

STOP RUN.
