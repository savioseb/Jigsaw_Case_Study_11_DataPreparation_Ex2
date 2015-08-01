/**************************************
CASE STUDY 11 - 04 - Data Preparation - Exercise 2
Data Prep Exercise 1: Car Retail Price
File Used: DataPrep1.csv
STEP 5: Segmenting Height and Weight by Small Medium and Large
*********************************************/


LIBNAME CS11E02 '/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy11_DataPreparation_Ex2/Datasets';



/******************************************************************
6. Segmenting Height and Weight by Small Medium Large
******************************************************************/


/** Getting the quartile information *******/
PROC MEANS Q1 Q3 NOPRINT
	DATA=CS11E02.DATA_PREP_ADDING_DUMMY;
	VAR height weight;
	OUTPUT
		OUT=QUARTILES_INFO
		Q1(height)=height_q1
		Q3(height)=height_q3
		Q1(weight)=weight_q1
		Q3(weight)=weight_q3;
RUN;


/** Creating dummy variable to do a successful merge **/
DATA CS11E02.DATA_PREP_WITH_FIELD;
	SET CS11E02.DATA_PREP_ADDING_DUMMY;
	FIELD=1;
RUN;

/** Creating dummy variable to do a successful merge **/
DATA CS11E02.QUARTILES_INFO_WITH_FIELD;
	SET CS11E02.QUARTILES_INFO(DROP=_TYPE_ _FREQ_);
	FIELD=1;
RUN;

/** Merging the data so we can create buckets for height and weight **/
DATA CS11E02.DATA_PREP_Q13_HT_WT_MERGE;
	MERGE 
		CS11E02.DATA_PREP_WITH_FIELD 
		CS11E02.QUARTILES_INFO_WITH_FIELD;
	BY FIELD;
	IF height < height_q1 
		THEN DO;
			height_small = 1;
			height_medium = 0;
			height_large = 0; 
		END;
		ELSE IF height < height_q3
			THEN DO;
				height_small = 0;
				height_medium = 1;
				height_large = 0;
			END;
		ELSE DO;
			height_small = 0;
			height_medium = 0;
			height_large = 1;
		END;
	IF weight < weight_q1 
		THEN DO;
			weight_small = 1;
			weight_medium = 0;
			weight_large = 0; 
		END;
		ELSE IF weight < weight_q3
			THEN DO;
				weight_small = 0;
				weight_medium = 1;
				weight_large = 0;
			END;
		ELSE DO;
			weight_small = 0;
			weight_medium = 0;
			weight_large = 1;
		END;
RUN;


/** Printing the weight and height categories with the quartile 1 and 3 values along with
the dummy values **/
PROC PRINT
	DATA=CS11E02.DATA_PREP_Q13_HT_WT_MERGE (OBS=20);
	VAR MSRP height height_q1 height_q3 
		height_small height_medium height_large
		weight weight_q1 weight_q3  
		weight_small weight_medium weight_large;
	TITLE1 "6. Adding Variables to categorize height and weight into small, medium and large";
	TITLE2 "Displaying 20 Rows with the variables";


/** The Model **/
PROC REG 
	DATA = CS11E02.DATA_PREP_Q13_HT_WT_MERGE;
	MODEL MSRP = 
			city high length width 
			luggage horse Cyl Disp
			fuel
			sedan_dummy hatch_dummy convert_dummy minivan_dummy miniSUV_dummy 
			SUV_dummy wagon_dummy subcom_dummy compact_dummy fullsize_dummy 
			luxury_dummy sport_dummy AWD_dummy FWD_dummy FOURWD_dummy 
			height_small height_medium height_large
			weight_small weight_medium weight_large;
	TITLE1 "weight_medium has highest impact - Adjusted R-square has the most impact";
	TITLE2 "Model improves marginally";
RUN;
