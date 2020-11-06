       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID.    paragraphs.
AUTHOR. Derrick Strong.
DATE-WRITTEN.November 6th 2020
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.


PROCEDURE DIVISION.
*> Gravity Driven Programming
*> Open Paragraph
*> Add a period at the end of each Paragraph AND PERFORM Action ie. DISPLAY or if no DISPLAY at the end of PERFORM
SubOne.
       DISPLAY "In Paragraph 1"
       PERFORM SubTwo
       DISPLAY " Returned to Paragraph 1".
       *> Run/Perform code twice
       PERFORM SubFour 2 TIMES.

SubThree.
       DISPLAY "In Paragraph 3".

SubTwo.
       DISPLAY "In Paragraph 2"
       PERFORM SubThree
       DISPLAY "Returned to Paragraph 2".

SubFour.
       DISPLAY "Repeat".


STOP RUN.
