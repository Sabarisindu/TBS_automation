*** Keywords ***
TBS-NEC_TS-009

	${xml}=    Parse XML    ../Object Repository/1099Nec.xml
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_selectpayer}=    		Get Element Text    	${xml}   	selectpayer
	${obj_psearch}=			Get Element Text	${xml}		psearch
	${obj_spayer}=			Get Element Text	${xml}		spayer
	${obj_reciselect}=			Get Element Text	${xml}		reciselect			
	${obj_savecont}=			Get Element Text    	${xml} 		savecont
	${obj_saveadd}=		Get Element Text    	${xml}		saveadd
	${obj_addressent}=			Get Element Text    	${xml} 		addressent
	${obj_addresscont}=		Get Element Text    	${xml}		addresscont
	${obj_reciselect1}=			Get Element Text	${xml}		reciselect1
	${obj_recitin}=			Get Element Text	${xml}		rssn
	${obj_rname}=		Get Element Text    	${xml}		rname
	${obj_raddress}=			Get Element Text    	${xml} 		raddress
	${obj_rcity}=		Get Element Text    	${xml}		rcity
	${obj_rzipcode}=			Get Element Text	${xml}		rzip
	${obj_rstate}=		Get Element Text    	${xml}		rstate
	${obj_nonemp}=			Get Element Text    	${xml}   	b1nonemp
	${obj_payersales}=		Get Element Text    	${xml}   	b2payersales
	${obj_fdwh}=			Get Element Text    	${xml}   	b4fdwh	
	Open Workbook      ${wbook}
	
	${obj_recitin1}=	Get cell value    10    E   1099_Nec_Scenario
	${obj_rname1}=	Get cell value    10    C   1099_Nec_Scenario
	${obj_raddress1}=	Get cell value    10    G   1099_Nec_Scenario
	${obj_rcity1}=	Get cell value    10    I   1099_Nec_Scenario
	${obj_rzipcode1}=	Get cell value    10    K   1099_Nec_Scenario
	${obj_nonemp1}=	Get cell value    10    W   1099_Nec_Scenario
	${obj_fdwh1}=	Get cell value    10   Y   1099_Nec_Scenario
	
	Execute Javascript    window.location.reload(true);
	sleep	10s
	Input Text	${obj_recitin}		${obj_recitin1}
	Input Text	${obj_rname}		${obj_rname1}
	Input Text	${obj_raddress}		${obj_raddress1}
	Input Text	${obj_rcity}		${obj_rcity1}
	Input Text	${obj_rzipcode}		${obj_rzipcode1}
	sleep	5s 
	Execute Javascript  document.evaluate('${obj_rstate}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
  	sleep   2s
	Wait Until Element Is Enabled		//div[contains (text(), "Alaska (AK)")]
	Click Element		//div[contains (text(), "Alabama (AL)")]

	Input Text			${obj_nonemp}		${obj_nonemp1}	
	#Click Element			${obj_payersales}	
	Input Text			${obj_fdwh}		${obj_fdwh1}                              
	Click Element       ${obj_saveadd}
	sleep	5s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont}
	Execute Javascript    window.document.evaluate('${obj_recitin}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true); 
	if ${obj_recitin}.startswith('666') || ${obj_recitin}.startswith('9')	:
	Page Should Contain Element	Recipient's SSN should not begin with 666 or 9
	Run Keyword Unless    ${passed}       Capture Page Screenshot     ../Support/Screenshots/${logid}_TBS-NEC_TS-009.png
  	Run Keyword Unless    ${passed}      writelog    '${logid}','TBS-NEC_TS-009','Create form with Recipient TIN starts with 666/9 ','Error message should be shown','Error message is shown','Pass','${logid}_TBS-NEC_TS-009.png'
	