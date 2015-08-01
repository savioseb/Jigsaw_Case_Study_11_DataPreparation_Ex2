/**************************************
CASE STUDY 11 - 04 - Data Preparation - Exercise 2
Data Prep Exercise 1: Car Retail Price
File Used: DataPrep1.csv
STEP 4: Number of Valid Records - The Linear Model
*********************************************/


LIBNAME CS11E02 '/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy11_DataPreparation_Ex2/Datasets';


/*************************************************************
3. What model would be appropriate?
4. How many valid records exist?
5. What Additional variables would you create
***************************************************************/



PROC REG 
	DATA = CS11E02.DATA_PREP_ADDING_DUMMY;
	MODEL MSRP = 
			city high length width height
			weight luggage horse Cyl Disp
			fuel
			sedan_dummy hatch_dummy convert_dummy minivan_dummy miniSUV_dummy 
			SUV_dummy wagon_dummy subcom_dummy compact_dummy fullsize_dummy 
			luxury_dummy sport_dummy AWD_dummy FWD_dummy FOURWD_dummy ;	
	TITLE1 "3. Linear Regression Model would be appropriate";	
	TITLE2 "4. 241 Valid Rows Exist";
	TITLE3 "5. 15 Additional Variables were created to Allow for Categorical Variables";
	TITLE5 "sedan_dummy hatch_dummy convert_dummy minivan_dummy miniSUV_dummy";
	TITLE6 "SUV_dummy wagon_dummy subcom_dummy compact_dummy fullsize_dummy";
	TITLE7 "luxury_dummy sport_dummy AWD_dummy FWD_dummy FOURWD_dummy";
RUN;

