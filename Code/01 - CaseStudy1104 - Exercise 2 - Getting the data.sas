/**************************************
CASE STUDY 11 - 04 - Data Preparation - Exercise 2
Data Prep Exercise 1: Car Retail Price
File Used: DataPrep1.csv
STEP 1: Getting the Data
*********************************************/


LIBNAME CS11E02 '/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy11_DataPreparation_Ex2/Datasets';

/** Importing the Dataset **/
PROC IMPORT
	Datafile='/folders/myshortcuts/myfolder/Foundation Exercises/Assignments/Class11 - Data Exploration and Preparation/Data Preparation/DataPrep_Final.csv'
	DBMS=CSV
	REPLACE
	OUT=CS11E02.DATA_PREP_READ;
RUN;

