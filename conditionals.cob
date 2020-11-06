       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    conditionals.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020

ENVIRONMENT DIVISION.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 Age PIC 99 VALUE 0.
01 Grade PIC 99 VALUE 0.
01 CanVoteFlag PIC 9 VALUE 0.
       *> Set Condition to Variable with 88
       88 CanVote VALUE 1.
       88 CantVote VALUE 0.

PROCEDURE DIVISION.
DISPLAY "Enter Age: " WITH NO ADVANCING
ACCEPT Age
*> If/Else Conditional
IF Age > 18 THEN
   DISPLAY "You Can Vote!"
ELSE
   DISPLAY "You Can't Vote!"
END-IF
*> Avoid If/Else If Conditionals because it can get messy; instead use multiple/separate if statements
IF Age LESS THAN 5
       DISPLAY "Stay Home"
END-IF
IF Age = 5
       DISPLAY "Go to Kindergarten"
END-IF
IF Age > 5 AND Age < 18
   COMPUTE Grade = Age - 5
   DISPLAY "Go to Grade " Grade 
END-IF
IF Age GREATER THAN OR EQUAL TO 18
       DISPLAY "Go to College"
END-IF


STOP RUN.
