       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    math.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020
ENVIRONMENT DIVISION.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 Num1 PIC 9 VALUE 5.
01 Num2 PIC 9 VALUE 2.
01 Num3 PIC 9 VALUE 3.
01 Ans PIC S99V999 VALUE 0.
01 Rem PIC 9V99.


PROCEDURE DIVISION.
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