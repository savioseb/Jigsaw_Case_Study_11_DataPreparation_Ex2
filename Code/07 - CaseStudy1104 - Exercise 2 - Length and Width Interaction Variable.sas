/**************************************
CASE STUDY 11 - 04 - Data Preparation - Exercise 2
Data Prep Exercise 1: Car Retail Price
File Used: DataPrep1.csv
STEP 7: Interaction Variable - Length and Width
*********************************************/


LIBNAME CS11E02 '/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy11_DataPreparation_Ex2/Datasets';


/********************************************************************
8. Length and width interaction variable
**************************************************************/

/** creating length_width_interaction variable **/
DATA CS11E02.DATA_PREP_LENGTH_WIDTH;
	SET CS11E02.DATA_PREP_LUX_LENGTH;
	length_width_interaction = length / width;
RUN;


/** Printing 20 rows of length_width_interaction */
PROC PRINT
	DATA=CS11E02.DATA_PREP_LENGTH_WIDTH (OBS=20);
	VAR MSRP length width length_width_interaction;
	TITLE1 "8. Length and Width Interaction.";
	TITLE2 "Printing 20 rows of the variables";
RUN;

PROC REG
	DATA=CS11E02.DATA_PREP_LENGTH_WIDTH;
	MODEL MSRP = length_width_interaction;
	TITLE1 "Length and Width Interaction Variable does not seem to play a significant predictor";
	TITLE2 "P-value is 0.49";
RUN;

