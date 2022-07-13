*** Keywords ***
TBS-DIV_TS-004
	
	Open Workbook      ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_clear}=		fndbget      select objvalue from tb_autoobj where objname='clear' and objpg='1099nec'
	${obj_selectpayer}=    	fndbget      select objvalue from tb_autoobj where objname='selectpayer' and objpg='1099-div'
	${obj_psearch}=		fndbget      select objvalue from tb_autoobj where objname='psearch' and objpg='1099-div'
	${obj_spayer}=		fndbget      select objvalue from tb_autoobj where objname='spayer' and objpg='1099-div'
	${obj_rlookup}=    	fndbget      select objvalue from tb_autoobj where objname='rlookup' and objpg='1099-div'
	${obj_rtype}=		fndbget      select objvalue from tb_autoobj where objname='rtype' and objpg='1099-div'
	${obj_reciselect}=	fndbget      select objvalue from tb_autoobj where objname='reciselect' and objpg='1099-div'
	${obj_b1a}=		fndbget      select objvalue from tb_autoobj where objname='b1a' and objpg='1099-div'
	${obj_b4}=		fndbget      select objvalue from tb_autoobj where objname='b4' and objpg='1099-div'
	${obj_savecont}=	fndbget      select objvalue from tb_autoobj where objname='savecont' and objpg='1099-div'
	${obj_addnew}=		fndbget      select objvalue from tb_autoobj where objname='addnew' and objpg='1099-div'
	${obj_clickdiv}=	fndbget      select objvalue from tb_autoobj where objname='clickdiv' and objpg='1099-div'
	${obj_clickfilediv}=	fndbget      select objvalue from tb_autoobj where objname='clickfilediv' and objpg='1099-div'
	${obj_clickmanual}=	fndbget      select objvalue from tb_autoobj where objname='clickmanual' and objpg='1099nec'
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'and objpg='1099nec'
	${obj_addressent}=	fndbget      select objvalue from tb_autoobj where objname='addressent' and objpg='1099nec'
	${obj_addresscont}=	fndbget      select objvalue from tb_autoobj where objname='addresscont' and objpg='1099nec'
	${obj_reciselect1}=	fndbget      select objvalue from tb_autoobj where objname='reciselect1' and objpg='1099nec'
	${obj_onlineaccess}=	fndbget      select objvalue from tb_autoobj where objname='onlinecheckbox' and objpg='1099nec'
	${obj_emailaddress}=	fndbget      select objvalue from tb_autoobj where objname='emailaddress' and objpg='1099nec'
	
	${TS_id}=       Get cell value    5    B   1099_Div_Scenario
	${TS_desc}=       Get cell value    5    AQ   1099_Div_Scenario
#Select the business from popup	
	Wait Until Element is Enabled	${obj_clear}	20s
	Click Element		${obj_clear}
        ${Businessdata}=       Get cell value    5    A   1099_Div_Scenario
	sleep	10s
	Click Element          	${obj_selectpayer}		
	sleep 	10s			
	Input Text		${obj_psearch}		${Businessdata}	
        sleep   5s	
	Click Element        	${obj_spayer} 
        
#select the recipient from lookup
	sleep   3s
	${obj_rtype1}=	Get cell value    5    C   1099_Div_Scenario
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element          	${obj_rlookup}		
	sleep 	10s		
	Input Text		${obj_rtype}		${obj_rtype1}
	Click Element           ${obj_reciselect}  

#Write Federal details
	${obj_b1a-1}=	Get cell value    5    Y    1099_Div_Scenario
	${obj_b4-1}=	Get cell value    4    AH   1099_Div_Scenario

	Input Text 		${obj_b1a}		${obj_b1a-1}	
	sleep   1s
	Input Text		${obj_b4}		${obj_b4-1}

#Opting online access
	${obj_onlineaccemail}	Get cell value    10    A   1099_Div_Scenario

	Click Element	        ${obj_onlineaccess}
	press keys      	${obj_emailaddress}        CTRL+a+BACKSPACE	
	Input Text		${obj_emailaddress}	${obj_onlineaccemail}

	${passed1} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s		
	Click Element       ${obj_saveadd}
	
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 

#Take Screenshot	
	sleep	1s
	Run Keyword 	Capture Page Screenshot   ../Support/Screenshots/${TS_id}.png	
#Write log
	Run Keyword If	${passed1}      writelog    '${logid}','${TS_id}','${TS_desc}','DIV form Should be created by opting online access','DIV form is has been created by opting online access successfully','Pass','${TS_id}.png'
 	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','DIV form should be created by opting online access','DIV form is not created by opting online access','Fail','${TS_id}.png'