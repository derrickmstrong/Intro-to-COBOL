       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    figurativeconstants.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020
ENVIRONMENT DIVISION.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
*> Alphanumeric
01 SampleData  PIC X(10) VALUE "Stuff".

PROCEDURE DIVISION.
MOVE "More Stuff " TO SampleData
MOVE "123" TO SampleData
MOVE 123 TO SampleData
DISPLAY "SampleData: " SampleData

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

STOP RUN.
