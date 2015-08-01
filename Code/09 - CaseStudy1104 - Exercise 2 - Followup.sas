/**************************************
CASE STUDY 11 - 04 - Data Preparation - Exercise 2
Data Prep Exercise 1: Car Retail Price
File Used: DataPrep1.csv
STEP 9: Followup
*********************************************/


LIBNAME CS11E02 '/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy11_DataPreparation_Ex2/Datasets';


/****************************************************************
10. Follow up question.
****************************************************************/

/** First we build a model including all the new interaction variables */
PROC REG
	DATA=CS11E02.DATA_PREP_HIGHWAY_PRICE_IMPACT;
	MODEL MSRP = 
		city high length width 
		luggage horse Cyl Disp
		fuel
		sedan_dummy hatch_dummy convert_dummy minivan_dummy miniSUV_dummy 
		SUV_dummy wagon_dummy subcom_dummy compact_dummy fullsize_dummy 
		luxury_dummy sport_dummy AWD_dummy FWD_dummy FOURWD_dummy 
		height_small height_medium height_large
		weight_small weight_medium weight_large
		length_width_interaction
		luxury_length_interaction
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
	TITLE1 "Creating new Model with all the interaction elements";
	TITLE2 "We need to next improve the model by removing insignificant predictors one by one";
	TITLE3 "And determining it's effect on the Model";
RUN;