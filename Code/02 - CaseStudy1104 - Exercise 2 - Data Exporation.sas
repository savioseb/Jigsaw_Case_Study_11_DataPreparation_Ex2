/**************************************
CASE STUDY 11 - 04 - Data Preparation - Exercise 2
Data Prep Exercise 1: Car Retail Price
File Used: DataPrep1.csv
STEP 2: Printing 20 rows - looking at the data
*********************************************/


LIBNAME CS11E02 '/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy11_DataPreparation_Ex2/Datasets';



/**************************************************************
1. How could the data be used to arrive at a suggested price
**************************************************************/

/** Printing 20 rows to understand the data and give answer the question **/
PROC PRINT
	DATA = CS11E02.DATA_PREP_READ (OBS=20);
	TITLE1 "1. How could the data be used to arrive at a suggested price?";
	TITLE2 "Exploring the data - Printing 20 rows";
	TITLE3 "A Linear Regression Model can be used to arrive at a Price Point";
	TITLE4 "Keeping the MSRP as response variable";
	TITLE5 "All other variables can be used as predictor Variables.";
RUN;
