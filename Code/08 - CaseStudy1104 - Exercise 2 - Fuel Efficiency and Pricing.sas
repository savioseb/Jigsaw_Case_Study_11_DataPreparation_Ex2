/**************************************
CASE STUDY 11 - 04 - Data Preparation - Exercise 2
Data Prep Exercise 1: Car Retail Price
File Used: DataPrep1.csv
STEP 8: Interaction Variable - Fuel Efficiency and Pricing
*********************************************/


LIBNAME CS11E02 '/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy11_DataPreparation_Ex2/Datasets';


/******************************************************
9. Highway Fuel Efficiency impact on pricing - segment wise
******************************************************/

/** Creating an interaction variable for luxury and non-luxury vehicles and their 
highway fuel efficiency - to investigate the price impact **/
DATA CS11E02.DATA_PREP_HIGHWAY_PRICE_IMPACT;
	SET CS11E02.DATA_PREP_LENGTH_WIDTH;
	luxury_high_interaction = high * luxury_dummy;
	luxury_non_high_interaction = high * ^(luxury_dummy);
	sedan_high_interaction = high * sedan_dummy;
	sedan_non_high_interaction = high * ^(sedan_dummy);
	hatch_high_interaction = high * hatch_dummy;
	hatch_non_high_interaction = high * ^(hatch_dummy);
	convert_high_interaction = high * convert_dummy;
	convert_non_high_interaction = high * ^(convert_dummy);
	minivan_high_interaction = high * minivan_dummy;
	minivan_non_high_interaction = high * ^(minivan_dummy);
	miniSUV_high_interaction = high * miniSUV_dummy;
	miniSUV_non_high_interaction = high * ^(miniSUV_dummy);
	SUV_high_interaction = high * SUV_dummy;
	SUV_non_high_interaction = high * ^(SUV_dummy);
	wagon_high_interaction = high * wagon_dummy;
	wagon_non_high_interaction = high * ^(wagon_dummy);
	subcom_high_interaction = high * subcom_dummy;
	subcom_non_high_interaction = high * ^(subcom_dummy);
	compact_high_interaction = high * compact_dummy;
	compact_non_high_interaction = high * ^(compact_dummy);
	fullsize_high_interaction = high * fullsize_dummy;
	fullsize_non_high_interaction = high * ^(fullsize_dummy);
	sport_high_interaction = high * sport_dummy;
	sport_non_high_interaction = high * ^(sport_dummy);
RUN;


/** Printing the new variables 
luxury_high_interaction luxury_non_high_interaction
sedan_high_interaction sedan_non_high_interaction 
hatch_high_interaction hatch_non_high_interaction 
convert_high_interaction convert_non_high_interaction
minivan_high_interaction minivan_non_high_interaction 
miniSUV_high_interaction miniSUV_non_high_interaction
SUV_high_interaction SUV_non_high_interaction
wagon_high_interaction wagon_non_high_interaction
subcom_high_interaction subcom_non_high_interaction 
compact_high_interaction compact_non_high_interaction 
fullsize_high_interaction fullsize_non_high_interaction
sport_high_interaction sport_non_high_interaction
**/
PROC PRINT
	DATA=CS11E02.DATA_PREP_HIGHWAY_PRICE_IMPACT (OBS=20);
	VAR MSRP 
		luxury_dummy luxury_high_interaction luxury_non_high_interaction
		sedan_dummy sedan_high_interaction sedan_non_high_interaction
		hatch_dummy hatch_high_interaction hatch_non_high_interaction
		convert_dummy convert_high_interaction convert_non_high_interaction
		minivan_dummy minivan_high_interaction minivan_non_high_interaction 
		miniSUV_dummy miniSUV_high_interaction miniSUV_non_high_interaction
		SUV_dummy SUV_high_interaction SUV_non_high_interaction
		wagon_dummy wagon_high_interaction wagon_non_high_interaction
		subcom_dummy subcom_high_interaction subcom_non_high_interaction 
		compact_dummy compact_high_interaction compact_non_high_interaction 
		fullsize_dummy fullsize_high_interaction fullsize_non_high_interaction
		sport_dummy sport_high_interaction sport_non_high_interaction;
	TITLE1 "9. Highway Fuel Efficiency impact on pricing - segment wise";
	TITLE2 "Printing 20 rows of the data";
RUN;

/** Creating Model to analyze the Imapact of fuel efficiency on different
segments of vehicles **/
PROC REG
	DATA=CS11E02.DATA_PREP_HIGHWAY_PRICE_IMPACT;
	MODEL MSRP = 
		luxury_high_interaction luxury_non_high_interaction
		sedan_high_interaction sedan_non_high_interaction 
		hatch_high_interaction hatch_non_high_interaction 
		convert_high_interaction convert_non_high_interaction
		minivan_high_interaction minivan_non_high_interaction 
		miniSUV_high_interaction miniSUV_non_high_interaction
		SUV_high_interaction SUV_non_high_interaction
		wagon_high_interaction wagon_non_high_interaction
		subcom_high_interaction subcom_non_high_interaction 
		compact_high_interaction compact_non_high_interaction 
		fullsize_high_interaction fullsize_non_high_interaction
		sport_high_interaction sport_non_high_interaction;
	TITLE1 "Highway fuel efficiency interaction variables with different segments do have impact";
RUN;


