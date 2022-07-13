*** Keywords ***
TBS-NEC_TS-005

	${xml}=    Parse XML    ../Object Repository/1099Nec.xml
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_selectpayer}=    	fndbget      select objvalue from tb_autoobj where objname='selectpayer'
	${obj_psearch}=	        fndbget      select objvalue from tb_autoobj where objname='psearch'
	${obj_spayer}=		fndbget      select objvalue from tb_autoobj where objname='spayer'
	${obj_rlookup}=    	fndbget      select objvalue from tb_autoobj where objname='rlookup'
	${obj_rtype}=		fndbget      select objvalue from tb_autoobj where objname='rtype'
	${obj_reciselect}=	fndbget      select objvalue from tb_autoobj where objname='reciselect'			
	${obj_nonemp}=		fndbget      select objvalue from tb_autoobj where objname='b1nonemp'
	#${obj_payersales}=	fndbget      select objvalue from tb_autoobj where objname='b2payersales'
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
	${TS_id}=       Get cell value    6    B   1099_Nec_Scenario
	${TS_desc}=       Get cell value    6    Z   1099_Nec_Scenario
	Open Workbook      ${wbook}
	
	${obj_rtype1}=	Get cell value    6    C   1099_Nec_Scenario
	${obj_nonemp1}=	Get cell value    6    W   1099_Nec_Scenario
	${obj_fdwh1}=	Get cell value    6    Y   1099_Nec_Scenario
	
	
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}			${obj_rtype1}
	
	Click Element      ${obj_reciselect1}                              
						
	Input Text			${obj_nonemp}		${obj_nonemp1}	
	#Click Element			${obj_payersales}	
	Input Text			${obj_fdwh}		${obj_fdwh1}
	${passed5} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s
	Click Element       ${obj_saveadd}
	
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
	sleep	5s
	Run Keyword	Capture Page Screenshot     ../Support/Screenshots/${TS_id}.png
	
  	Run Keyword If	${passed5}      writelog    '${logid}','${TS_id}','${TS_desc}','NEC form should be created for Recipient without TIN','NEC form is created for Recipient without TIN','Pass','${TS_id}.png'
	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','NEC form should be created for Recipient without TIN','NEC form is created for Recipient without TIN','Fail','${TS_id}.png'