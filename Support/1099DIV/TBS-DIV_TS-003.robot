*** Keywords ***
TBS-DIV_TS-003
	
	Open Workbook      ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_rlookup}=		fndbget      select objvalue from tb_autoobj where objname='rlookup' 	 
	${obj_rtype}=		fndbget      select objvalue from tb_autoobj where objname='rtype' 	 
	${obj_reciselect}=	fndbget      select objvalue from tb_autoobj where objname='reciselect' and objpg='1099-div'
	${obj_b1a}=  		fndbget      select objvalue from tb_autoobj where objname='b1a'	 
	${obj_b1b}=		fndbget      select objvalue from tb_autoobj where objname='b1b' 	 		
	${obj_b2a}=		fndbget      select objvalue from tb_autoobj where objname='b2a' 	 
	${obj_b2b}=		fndbget      select objvalue from tb_autoobj where objname='b2b' 	
	${obj_b2c}=		fndbget      select objvalue from tb_autoobj where objname='b2c'	 
	${obj_b2d}=		fndbget      select objvalue from tb_autoobj where objname='b2d' 	
	${obj_b2e}=		fndbget      select objvalue from tb_autoobj where objname='b2e'  	
	${obj_b2f}= 		fndbget      select objvalue from tb_autoobj where objname='b2f' 	 
	${obj_b3}=		fndbget      select objvalue from tb_autoobj where objname='b3'  	 
	${obj_b4}=		fndbget      select objvalue from tb_autoobj where objname='b4'  	 
	${obj_b5}=		fndbget      select objvalue from tb_autoobj where objname='b5'  	
	${obj_b6}=		fndbget      select objvalue from tb_autoobj where objname='b6'  	 
	${obj_b7}=		fndbget      select objvalue from tb_autoobj where objname='b7'   	 
	${obj_b8}=		fndbget      select objvalue from tb_autoobj where objname='b8'  	 
	${obj_b9}=		fndbget      select objvalue from tb_autoobj where objname='b9'	 	 	
	${obj_b10}=		fndbget      select objvalue from tb_autoobj where objname='b10' 	 
	${obj_b11}=		fndbget      select objvalue from tb_autoobj where objname='b11' 	 
	${obj_b12}=		fndbget      select objvalue from tb_autoobj where objname='b12' 	 
	${obj_savecont}=	fndbget      select objvalue from tb_autoobj where objname='savecont'    
	${obj_addnew}=		fndbget      select objvalue from tb_autoobj where objname='addnew' 	 
	${obj_clickdiv}=	fndbget      select objvalue from tb_autoobj where objname='clickdiv'    
	${obj_clickfilediv}=	fndbget      select objvalue from tb_autoobj where objname='clickfilediv'
	${obj_clickmanual}=	fndbget      select objvalue from tb_autoobj where objname='clickmanual' 
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'     
	${obj_addressent}=	fndbget      select objvalue from tb_autoobj where objname='addressent'  
	${obj_addresscont}=	fndbget      select objvalue from tb_autoobj where objname='addresscont' 
	${obj_reciselect1}=	fndbget      select objvalue from tb_autoobj where objname='reciselect1' and objpg='1099-div' 

	${TS_id}=         Get cell value    4    B   1099_Div_Scenario
	${TS_desc}=       Get cell value    4    AQ   1099_Div_Scenario
#select the recipient from lookup
	sleep   5s
	${obj_rtype1}=	Get cell value    4    C   1099_Div_Scenario
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element          	${obj_rlookup}		
	sleep 	5s		
	Input Text		${obj_rtype}		${obj_rtype1}
	sleep	5s
	Click Element           ${obj_reciselect}  
	sleep	7s

#Write Federal details
	${obj_b1a-1}=	Get cell value    4    Y    1099_Div_Scenario
	${obj_b1b-1}=	Get cell value    4    Z    1099_Div_Scenario
	${obj_b2a-1}=	Get cell value    4    AA   1099_Div_Scenario
      	${obj_b2b-1}=	Get cell value    4    AB   1099_Div_Scenario
	${obj_b2c-1}=	Get cell value    4    AC   1099_Div_Scenario
	${obj_b2d-1}=	Get cell value    4    AD   1099_Div_Scenario
	${obj_b2e-1}=	Get cell value    4    AE   1099_Div_Scenario
	${obj_b2f-1}=	Get cell value    4    AF   1099_Div_Scenario
	${obj_b3-1}=	Get cell value    4    AG   1099_Div_Scenario
	${obj_b4-1}=	Get cell value    4    AH   1099_Div_Scenario
	${obj_b5-1}=	Get cell value    4    AI   1099_Div_Scenario
	${obj_b6-1}=	Get cell value    4    AJ   1099_Div_Scenario
	${obj_b7-1}=	Get cell value    4    AK   1099_Div_Scenario
	${obj_b8-1}=	Get cell value    4    AL   1099_Div_Scenario
	${obj_b9-1}=	Get cell value    4    AM   1099_Div_Scenario
	${obj_b10-1}=	Get cell value    4    AN   1099_Div_Scenario
	${obj_b11-1}=	Get cell value    4    AO   1099_Div_Scenario
	${obj_b12-1}=	Get cell value    4    AP   1099_Div_Scenario

	Input Text 		${obj_b1a}		${obj_b1a-1}
	sleep   1s
	Input Text			${obj_b1b}		${obj_b1b-1}
	sleep   1s
	Input Text			${obj_b2a}		${obj_b2a-1}
	sleep   1s
	Input Text			${obj_b2b}		${obj_b2b-1}
	sleep   1s
	Input Text			${obj_b2c}		${obj_b2c-1}
	sleep   1s
	Input Text			${obj_b2d}		${obj_b2d-1}
	sleep   1s
	Input Text			${obj_b2e}		${obj_b2e-1}
	sleep   1s
	Input Text			${obj_b2f}		${obj_b2f-1}
	sleep   1s
	Input Text			${obj_b3}		${obj_b3-1}
	sleep   1s
	Input Text			${obj_b4}		${obj_b4-1}
	sleep   1s
	Input Text			${obj_b5}		${obj_b5-1}
	sleep   1s
	Input Text			${obj_b6}		${obj_b6-1}
	sleep   1s
	Input Text			${obj_b7}		${obj_b7-1}
	sleep   1s
	Input Text			${obj_b8}		${obj_b8-1}
	sleep   1s
	Input Text			${obj_b9}		${obj_b9-1}
	sleep   1s
	Input Text			${obj_b10}		${obj_b10-1}
	sleep   1s
	Input Text			${obj_b11}		${obj_b11-1}
	sleep   1s
	Input Text			${obj_b12}		${obj_b12-1}
        Sleep	3s	
	
	${passed1} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s		
	Click Element       ${obj_saveadd}
	sleep	5s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	sleep	5s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	sleep	5s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
#Take Screenshot	
	sleep	1s
	Run Keyword 	Capture page Screenshot   ../Support/Screenshots/${TS_id}.png	
#Write log
	
	Run Keyword If	${passed1}      writelog    '${logid}','${TS_id}','${TS_desc}','DIV form should be created with all federal details','DIV form has been created with all federal details successfully','Pass','${TS_id}.png'
 	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','DIV form should be created with all federal details','DIV form not created with all federal details','Fail','${TS_id}.png'

