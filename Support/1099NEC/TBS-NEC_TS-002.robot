*** Keywords ***
TBS-NEC_TS-002

	
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_clear}=		fndbget      select objvalue from tb_autoobj where objname='clear'
	${obj_selectpayer}=    	fndbget      select objvalue from tb_autoobj where objname='selectpayer'
	${obj_psearch}=	        fndbget      select objvalue from tb_autoobj where objname='psearch'
	${obj_spayer}=		fndbget      select objvalue from tb_autoobj where objname='spayer'
	${obj_rlookup}=    	fndbget      select objvalue from tb_autoobj where objname='rlookup' 
	${obj_rtype}=		fndbget      select objvalue from tb_autoobj where objname='rtype'
	${obj_reciselect}=	fndbget      select objvalue from tb_autoobj where objname='reciselect'		
	${obj_nonemp}=		fndbget      select objvalue from tb_autoobj where objname='b1nonemp'
	${obj_payersales}=	fndbget      select objvalue from tb_autoobj where objname='b2payersales'
	${obj_fdwh}=		fndbget      select objvalue from tb_autoobj where objname='b4fdwh'	
	${obj_savecont}=	fndbget      select objvalue from tb_autoobj where objname='savecont'
	${obj_addnew}=		fndbget      select objvalue from tb_autoobj where objname='addnew' 
	${obj_clicknec}=	fndbget      select objvalue from tb_autoobj where objname='clicknec' 
	${obj_clickfilenec}=	fndbget      select objvalue from tb_autoobj where objname='clickfilenec'
	${obj_clickmanual}=	fndbget      select objvalue from tb_autoobj where objname='clickmanual' 
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'
	${obj_addressent}=	fndbget      select objvalue from tb_autoobj where objname='addressent'
	${obj_addresscont}=	fndbget      select objvalue from tb_autoobj where objname='addresscont'
	${obj_reciselect1}=	fndbget      select objvalue from tb_autoobj where objname='reciselect1'

	${TS_id}=       Get cell value    3    B   1099_Nec_Scenario
	${TS_desc}=       Get cell value    3    Z   1099_Nec_Scenario
	Open Workbook      ${wbook}
	Wait Until Element is Enabled	${obj_clear}	20s
	Click Element		${obj_clear}
	${Businessdata}=       Get cell value    6    A   1099_Nec_Scenario
	
	Click Element           	${obj_selectpayer}		
	sleep 	10s			
	Input Text			${obj_psearch}			${Businessdata}		
	Click Element        		${obj_spayer}
	${obj_rtype1}=	Get cell value    3    C   1099_Nec_Scenario
	${obj_nonemp1}=	Get cell value    3    W   1099_Nec_Scenario
	
	sleep 	10s
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}			${obj_rtype1}
	Click Element      ${obj_reciselect}                              				
	Input Text			${obj_nonemp}		${obj_nonemp1}	
	${passed2} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s	
	Click Element       ${obj_saveadd}
	
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont}
	
	Run Keyword        Capture Page Screenshot     ../Support/Screenshots/${TS_id}.png
	Run Keyword If    ${passed2}      writelog    '${logid}','${TS_id}','${TS_desc}','NEC form should be created with foreign address','NEC form created with foreign address','Pass','${TS_id}.png' 
	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','NEC form should be created with foreign address','NEC form created with foreign address','Fail','${TS_id}.png'