       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    strings.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
       01  SampStr     PIC X(17) VALUE 'Hello Mario World'.
       01  NumChars    PIC 99 VALUE ZEROS.
       01  NumOs       PIC 99 VALUE ZEROS.
       01  FName       PIC X(6) VALUE 'Martin'.
       01  MName       PIC X(11) VALUE 'Luther King'.
       01  LName       PIC X(4) VALUE 'King'.
       01  FLName      PIC X(11).
       01  FMLName     PIC X(18).
       01  SStr1       PIC X(7) VALUE 'The egg'.
       01  SStr2       PIC X(9) VALUE 'is #1 and'.
       01  Dest        PIC X(33) VALUE 'is the big chicken'.
       01  Ptr         PIC 9 VALUE 1.
       01  SStr3       PIC X(3).
       01  SStr4       PIC X(3).

PROCEDURE DIVISION.
       *> Search the SampStr and Count/Tally the Characters and store the number in the NumChars variable
       INSPECT SampStr TALLYING NumChars FOR CHARACTERS.
       DISPLAY 'Number of Characters: ' NumChars.

       *> Search SampStr and Count/Tally up all the 'o' chars and store it in NumOs variable
       INSPECT SampStr TALLYING NumOs FOR ALL 'o'.
       DISPLAY "Number of O's: " NumOs.

       *> Convert to Uppercase
       DISPLAY FUNCTION UPPER-CASE(SampStr)

       *> Convert to LowerCase
       DISPLAY FUNCTION LOWER-CASE(SampStr)
       
       *> Join 2 strings with a space
       *> DELIMITED BY SIZE means you want the entire string
       STRING FName DELIMITED BY SIZE
       SPACE
       LName DELIMITED BY SIZE
       *> Store that concatenated STRING FName LName INTO FLName
       INTO FLName
       DISPLAY FLName

       *> Get the first word from FLName + SPACE + MName + SPACE + LName PUT INTO FMLName
       STRING FLName DELIMITED BY SPACES
       SPACE
       MName DELIMITED BY SIZE
       SPACE
       LName DELIMITED BY SIZE
       INTO FMLName
       *> If the FMLName container isn't big enough for the string then it overflows
       ON OVERFLOW 
           DISPLAY 'Overflowed'.
       DISPLAY FMLName.

       *> Get all of SStr1 add a space, get SStr2 up to # and put it into Dest starting at char 1 (overriding what is already in those spaces and display Dest. Show Overflowedddd if there is not enough spaces for the string)
       STRING SStr1 DELIMITED BY SIZE
       SPACE
       SStr2 DELIMITED BY "#"
       INTO Dest
       WITH POINTER Ptr
       ON OVERFLOW DISPLAY 'Overflowedddd'.
       DISPLAY Dest.

       *> UNSTRING is used to split a string apart and can be used to be put into muliple variables
       UNSTRING SStr1 DELIMITED BY SPACES
       INTO SStr3, SStr4
       END-UNSTRING.
       DISPLAY SStr3.
       DISPLAY SStr4.

STOP RUN.
