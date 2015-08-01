/**************************************
CASE STUDY 11 - 04 - Data Preparation - Exercise 2
Data Prep Exercise 1: Car Retail Price
File Used: DataPrep1.csv
STEP 6: Interaction Variable - Luxury and Length
*********************************************/


LIBNAME CS11E02 '/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy11_DataPreparation_Ex2/Datasets';


/**********************************************
7. Luxury and Length Interaction Variable
***********************************************/

/** creating interaction variable of luxury using luxury_dummy and length **/
DATA CS11E02.DATA_PREP_LUX_LENGTH;
	SET CS11E02.DATA_PREP_Q13_HT_WT_MERGE;
	luxury_length_interaction = luxury_dummy * length;
RUN;

/** Printing the luxury_length_interaction variable **/
PROC PRINT
	DATA=CS11E02.DATA_PREP_LUX_LENGTH (OBS=20);
	VAR MSRP luxury length luxury_length_interaction;
	TITLE1 "7. Luxury and Length interaction variable - Printing 20 rows";
RUN;

PROC REG
	DATA=CS11E02.DATA_PREP_LUX_LENGTH;
	MODEL MSRP = luxury_length_interaction;
	TITLE1 "Luxury & Length interaction seems to be a significant predictor";
	TITLE2 "P-value is < 0.0001";
RUN;

