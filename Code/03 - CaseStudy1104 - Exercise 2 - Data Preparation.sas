/**************************************
CASE STUDY 11 - 04 - Data Preparation - Exercise 2
Data Prep Exercise 1: Car Retail Price
File Used: DataPrep1.csv
STEP 3: Data Preparation
*********************************************/


LIBNAME CS11E02 '/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy11_DataPreparation_Ex2/Datasets';


/*********************************************************************
2. How would you prepare this dataset to be used in a model?
************************************************************************/

/** remove missing values data **/
DATA CS11E02.DATA_PREP_REMOVE_MISSING;
	SET CS11E02.DATA_PREP_READ;
	IF 
		MSRP ^= . AND
		sedan ^= "" AND
		hatch ^= "" AND 
		convert ^= "" AND
		minivan ^= "" AND
		miniSUV ^= "" AND
		SUV ^= "" AND
		wagon ^= "" AND
		subcom ^= "" AND
		compact ^= "" AND
		fullsize ^= "" AND
		luxury ^= "" AND
		sport ^= "" AND
		city ^= . AND
		high ^= . AND
		length ^= . AND
		width ^= . AND
		height ^= . AND
		weight ^= . AND
		luggage ^= . AND
		horse ^= . AND
		Cyl ^= . AND
		Disp ^= . AND
		fuel ^= . AND
		AWD ^= "" AND
		FWD ^= "" AND
		FOURWD ^= "";
RUN;

/** find out the class levels of the categorical variables to create 
dummy variables appropriately */
PROC FREQ
	DATA=CS11E02.DATA_PREP_READ;
	TABLE
		sedan
		hatch
		convert
		minivan
		miniSUV
		SUV
		wagon
		subcom 
		compact
		fullsize
		luxury 
		sport 
		Cyl
		Disp
		AWD
		FWD
		FOURWD;
	TITLE1 "2. Preparing Data for Modeling";
	TITLE2 "2.1 Remove Rows where there are missing values.";
	TITLE3 "Total Loss of Records: 10";
	TITLE6 "2.2 Understand the Class Levels in the Categorical Variables to make good Dummy Variables";
	TITLE7 "We can see that they are all just Binary Categorical Variables";
RUN;


/********** Creating Dummy Variables *****************/
/** Convert categorical variables to dummy numerical variables */
DATA CS11E02.DATA_PREP_ADDING_DUMMY;
	SET CS11E02.DATA_PREP_REMOVE_MISSING;
	IF sedan = "No" THEN sedan_dummy = 0; ELSE sedan_dummy = 1;
	IF hatch = "No" THEN hatch_dummy = 0; ELSE hatch_dummy = 1;
	IF convert = "No" THEN convert_dummy = 0; ELSE convert_dummy = 1;
	IF minivan = "No" THEN minivan_dummy = 0; ELSE minivan_dummy = 1;
	IF miniSUV = "No" THEN miniSUV_dummy = 0; ELSE miniSUV_dummy = 1;
	IF SUV = "No" THEN SUV_dummy = 0; ELSE SUV_dummy = 1;
	IF wagon = "No" THEN wagon_dummy = 0; ELSE wagon_dummy = 1;
	IF subcom = "No" THEN subcom_dummy = 0; ELSE subcom_dummy = 1;
	IF compact = "No" THEN compact_dummy = 0; ELSE compact_dummy = 1;
	IF fullsize = "No" THEN fullsize_dummy = 0; ELSE fullsize_dummy = 1;
	IF luxury = "No" THEN luxury_dummy = 0; ELSE luxury_dummy = 1;
	IF sport = "No" THEN sport_dummy = 0; ELSE sport_dummy = 1;	
	car_type = sedan_dummy + hatch_dummy + convert_dummy + minivan_dummy + miniSUV_dummy + 
		SUV_dummy + wagon_dummy + subcom_dummy + compact_dummy + fullsize_dummy +  
		luxury_dummy + sport_dummy;
	IF AWD = "No" THEN AWD_dummy = 0; ELSE AWD_dummy = 1;
	IF FWD = "No" THEN FWD_dummy = 0; ELSE FWD_dummy = 1;
	IF FOURWD = "No" THEN FOURWD_dummy = 0; ELSE FOURWD_dummy = 1;
	drive_type = AWD_dummy + FWD_dummy + FOURWD_dummy;
RUN;



/** Printing 20 rows of the Result Data Set */
PROC PRINT
	DATA = CS11E02.DATA_PREP_ADDING_DUMMY (OBS=20);
	VAR sedan sedan_dummy hatch hatch_dummy convert convert_dummy
		minivan minivan_dummy  miniSUV miniSUV_dummy
		SUV SUV_dummy wagon wagon_dummy
		subcom subcom_dummy compact compact_dummy
		fullsize fullsize_dummy luxury luxury_dummy
		sport sport_dummy AWD AWD_dummy
		FWD FWD_dummy FOURWD FOURWD_dummy;
	TITLE1 "2.3 Make dummy variables to represent the Categorical Variables";
	TITLE2 "Remove The Categorical Variables";
	TITLE4 "20 Rows of the Resultant Dataset";
RUN;

