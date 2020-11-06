       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    variables.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020
ENVIRONMENT DIVISION.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
*> Data Types includes Alphanumeric, Alphabetic and Numeric
*> Alphanumeric
01 SampleData  PIC X(10) VALUE "Stuff".
*> Alphabetic
01 JustLetters PIC AAA VALUE "ABC".
*> Numeric - Int 4 in length
01 JustNums PIC 9(4) VALUE 1234.
*> SignedInt - Positive or Negative int
01 SignedInt PIC S9(4) VALUE -1234.
*> Floating Point - Int with decimal
01 PayCheck PIC 9(4)V99 VALUE ZEROS.
*> Collection of Values
01 Customer.
       02 Ident    PIC 9(3).
       02 CustName PIC X(20).
       02 DateOfBirth.
           03 MOB PIC 9(2).
           03 DOB PIC 9(2).
           03 YOB PIC 9(4).
*> Other Variables
01 Num1 PIC 9 VALUE 5.
01 Num2 PIC 9 VALUE 2.
01 Num3 PIC 9 VALUE 3.
01 Ans PIC S99V999 VALUE 0.
01 Rem PIC 9V99.


PROCEDURE DIVISION.
MOVE "More Stuff " TO SampleData
MOVE "123" TO SampleData
MOVE 123 TO SampleData
DISPLAY "SampleData: " SampleData
MOVE 9999.99 TO PayCheck
DISPLAY "PayCheck: $"PayCheck
MOVE "123Derrick             01012020" TO Customer
DISPLAY "CustName: " CustName
DISPLAY "DateOfBirth: " MOB "/" DOB "/" YOB
*> Figurative Constants
MOVE ZERO TO SampleData
DISPLAY "SampleData to Zeros: " SampleData
MOVE SPACE to SampleData
DISPLAY "SampleData to Spaces: " SampleData
MOVE HIGH-VALUE TO SampleData
DISPLAY "SampleData to High-Value: " SampleData
MOVE LOW-VALUE TO SampleData
DISPLAY "SampleData to Low-Value: " SampleData
MOVE QUOTE TO SampleData
DISPLAY "SampleData to Quotes: " SampleData
MOVE ALL "2" TO SampleData
DISPLAY "SampleData to All 2s: " SampleData
*> Math
ADD Num1 TO Num2 GIVING Ans
DISPLAY "ADDITION: " Ans
SUBTRACT Num1 FROM Num2 GIVING Ans
DISPLAY "SUBTRACTION: " Ans
MULTIPLY Num1 BY Num2 GIVING Ans
DISPLAY "MULTIPLICATION: " Ans
DIVIDE Num1 BY Num2 GIVING Ans REMAINDER Rem
DISPLAY "DIVISION: " Ans  " WITH REMAINDER " Rem
ADD Num1, Num2, Num3 GIVING Ans
DISPLAY "Add Multiple values: " Ans
*> W/COMPUTE
COMPUTE Ans = Num1 + Num2
DISPLAY "ADDITION w/COMPUTE: " Ans
COMPUTE Ans = Num1 - Num2
DISPLAY "SUBTRATION w/COMPUTE: " Ans
COMPUTE Ans = Num1 * Num2
DISPLAY "MULTIPLICATION w/COMPUTE: " Ans
COMPUTE Ans = Num1 / Num2
DISPLAY "DIVISION w/COMPUTE: " Ans
COMPUTE Ans = Num1 ** 2
DISPLAY "POWER w/COMPUTE: " Ans
COMPUTE Ans ROUNDED = 3.0 + 2.005
DISPLAY "ROUND w/COMPUTE: " Ans
COMPUTE Ans = 7 + 48
DISPLAY "More w/COMPUTE: " Ans
COMPUTE Ans = (3 - 7) * 2
DISPLAY "Even More w/COMPUTE: " Ans



STOP RUN.
