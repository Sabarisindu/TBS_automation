*** Keywords ***
TBS-MISC_TS-007


	${logid}=     Get Environment Variable     logid
	Log to console       runid is ${logid}
	${xml}=    Parse XML    ../Object repository/1099Misc.xml
	${obj_bsearch}=		Get Element Text    	${xml}   	bsearch
	${obj_bselect}=		Get Element Text    	${xml}   	bselect
	${obj_recipient}=		Get Element Text    	${xml}   	recipient
	${obj_rsearch}=		Get Element Text    	${xml}   	rsearch
	${obj_rselect}=		Get Element Text    	${xml}   	rselect
	${obj_ErrorPopup}=		Get Element Text    	${xml}		ErrorPopup
	${obj_FixError}=		Get Element Text    	${xml}		FixError
	${obj_save}=		Get Element Text    	${xml}   	save
	${obj_savecon}=		Get Element Text    	${xml}   	savecon
	${obj_continue}=	Get Element Text    	${xml}   	continue
	${obj_address}=		Get Element Text    	${xml}          address


  ${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   1099Misc
  ${rows}=         Get Length  ${sheet}
 
	${RecipientTIN}=       Get cell value    8    C   1099Misc

	Execute Javascript    window.location.reload(true);
	#press keys	None		F5
	sleep    7s
	Click Element         ${obj_recipient}
	Wait Until Element Is Enabled 		${obj_rsearch}			10s
	input text			${obj_rsearch}		${RecipientTIN}
	Wait Until Element Is Enabled 		${obj_rselect}  		10s
	Click Element         ${obj_rselect}
	sleep    2s
	Click Element         ${obj_save}
	sleep    2s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}
	#Page Should Contain Element	${obj_ErrorPopup}
	sleep    2s
	Capture Page Screenshot 	${CURDIR}/Screenshot/TBS-MISC_TS-007.png
	Page Should Contain	F00-10008
	Page Should Contain	At least one of the boxes should contain an amount greater than $0.00
	Click Element         ${obj_FixError}
	
