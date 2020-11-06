       >>SOURCE FORMAT FREE
*> There are 4 divisions being identification, environment, data and procedure.
IDENTIFICATION DIVISION.
PROGRAM-ID.    introtocobol.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020

ENVIRONMENT DIVISION.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
*> Denotes a Comment
*> Alphanumeric
*> Variable can hold a alphanumeric with max length 30 starting value is DStrong
*> Picture Clause
01 UserName PIC X(30) VALUE "DStrong".
*> Numeric
*> Digit int between 0-9
01 Num1     PIC 9 VALUE ZEROS.
01 Num2     PIC 9 VALUE ZEROS.
*> Double Digit int between 0-99
01 Total    PIC 99 VALUE 0.
01 SSNum.
        02  SSArea      PIC 999.
        02  SSGroup     PIC 99.
        02  SSSerial    PIC 9999.
*> Alphabetic
01 FirstName PIC AAA VALUE "BOB".

*> Constant
01 PIValue  CONSTANT AS 3.14.

*> Figurative Constants
*> ZERO, ZEROS : Assigns zero
*> SPACE, SPACES : Assigns a space
*> HIGH-VALUE, HIGH-VALUES : Assigns largest value of defined type
*> LOW-VALUE, LOW-VALUES  : Assigns smallest value of defined type

PROCEDURE DIVISION.
*> Display Username
DISPLAY "What is your name? " WITH NO ADVANCING
ACCEPT UserName
DISPLAY "Hello " UserName
*> Move/Change value into/in variable
MOVE ZERO TO UserName
DISPLAY "New UserName after MOVE: " UserName
*> Get Total
DISPLAY "Enter 2 Values to sum: "
ACCEPT Num1
ACCEPT Num2
COMPUTE Total = Num1 + Num2
DISPLAY Num1 " + " Num2 " = " Total
*> Display SSN Area
DISPLAY "Enter your social security number: "
ACCEPT SSNum
DISPLAY "Area: " SSArea


STOP RUN.
