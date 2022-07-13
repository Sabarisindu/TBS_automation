*** Keywords ***
TBS-DIV_TS-001
	
	#${wbook}=     Set Variable     
	Open Workbook      ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_div}=		fndbget      select objvalue from tb_autoobj where objname='div' and objpg='1099-div'
	${obj_divbt}=		fndbget      select objvalue from tb_autoobj where objname='divbt' and objpg='1099-div'
	${obj_manualb}=		fndbget      select objvalue from tb_autoobj where objname='manualb' and objpg='1099-div'
	${obj_selectpayer}=    	fndbget      select objvalue from tb_autoobj where objname='selectpayer' and objpg='1099-div'
	${obj_psearch}=		fndbget      select objvalue from tb_autoobj where objname='psearch' and objpg='1099-div'
	${obj_spayer}=		fndbget      select objvalue from tb_autoobj where objname='spayer' and objpg='1099-div'
	${obj_rlookup}=    	fndbget      select objvalue from tb_autoobj where objname='rlookup' and objpg='1099-div'
	${obj_rtype}=		fndbget      select objvalue from tb_autoobj where objname='rtype' and objpg='1099-div'
	${obj_reciselect}=	fndbget      select objvalue from tb_autoobj where objname='reciselect' and objpg='1099-div'
	${obj_b1a}=		fndbget      select objvalue from tb_autoobj where objname='b1a' and objpg='1099-div'
	${obj_savecont}=	fndbget      select objvalue from tb_autoobj where objname='savecont' and objpg='1099-div'
	${obj_addnew}=		fndbget      select objvalue from tb_autoobj where objname='addnew' and objpg='1099-div'
	${obj_clickdiv}=	fndbget      select objvalue from tb_autoobj where objname='clickdiv' and objpg='1099-div'
	${obj_clickfilediv}=	fndbget      select objvalue from tb_autoobj where objname='clickfilediv' and objpg='1099-div'
	${obj_clickmanual}=	fndbget      select objvalue from tb_autoobj where objname='clickmanual' and objpg='1099nec'
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'and objpg='1099nec'
	${obj_addressent}=	fndbget      select objvalue from tb_autoobj where objname='addressent' and objpg='1099nec'
	${obj_addresscont}=	fndbget      select objvalue from tb_autoobj where objname='addresscont' and objpg='1099nec'
	${obj_reciselect1}=	fndbget      select objvalue from tb_autoobj where objname='reciselect1' and objpg='1099nec'	
	${TS_id}=   	  Get cell value    2    B   1099_Div_Scenario
	${TS_desc}=       Get cell value    2    AQ   1099_Div_Scenario
	
#Selecting Manual form 
	Wait Until Element is Enabled	${obj_div}	10s
	Click Element         ${obj_div}
	Sleep	3s
	Click Element         ${obj_divbt}
	Sleep	3s
	Click Element         ${obj_manualb}
	
#Select the business from popup	
        ${Businessdata}=       Get cell value    5    A   1099_Div_Scenario
	sleep	7s
	Click Element          	${obj_selectpayer}		
	sleep 	5s			
	Input Text		${obj_psearch}		${Businessdata}	
        sleep   5s	
	Click Element        	${obj_spayer} 
        
#select the recipient from lookup
	sleep   3s
	${obj_rtype1}=	Get cell value    2    C   1099_Div_Scenario
	
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element          	${obj_rlookup}		
	sleep 	7s		
	Input Text		${obj_rtype}		${obj_rtype1}
	Click Element           ${obj_reciselect}  
	sleep	7s
#Write Federal details
	${obj_b1a-1}=	Get cell value    2    Y   1099_Div_Scenario
	Input Text 		${obj_b1a}		${obj_b1a-1}	
	sleep 	7s
	${passed1} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     7s		
	Click Element       ${obj_saveadd}
	sleep 	5s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    15s
	sleep 	5s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    15s
	sleep 	5s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
#Take Screenshot
	sleep  3s
	#Page Should Contain Text Form 1099-DIV saved successfully	
	Run Keyword  Capture Page Screenshot   ../Support/Screenshots/${TS_id}.png	
#Write log

	Run Keyword If	${passed1}      writelog    '${logid}','${TS_id}','${TS_desc}','DIV form should be created with USPS address','DIV form has been created with USPS address successfully','Pass','${TS_id}.png'
 	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','DIV form should be created with USPS address','DIV form not created with USPS address','Fail','${TS_id}.png'