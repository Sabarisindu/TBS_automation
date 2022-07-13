*** Keywords ***
TBS-MISC_TS-001

	${logid}=     Get Environment Variable     logid
	Log to console       runid is ${logid}
	${xml}=    Parse XML    ../Object repository/1099Misc.xml
	${obj_miscform}=		Get Element Text    	${xml}   	miscform
	${obj_taxyear2021}=		Get Element Text    	${xml}   	taxyear2021
	${obj_manual}=		Get Element Text    	${xml}   	manual
	${obj_business}=		Get Element Text    	${xml}   	business
	${obj_bsearch}=		Get Element Text    	${xml}   	bsearch
	${obj_bselect}=		Get Element Text    	${xml}   	bselect
	${obj_recipient}=		Get Element Text    	${xml}   	recipient
	${obj_rsearch}=		Get Element Text    	${xml}   	rsearch
	${obj_rselect}=		Get Element Text    	${xml}   	rselect
	${obj_line1}=		Get Element Text    	${xml}   	line1
	${obj_save}=		Get Element Text    	${xml}   	save
	${obj_savecon}=		Get Element Text    	${xml}   	savecon
	${obj_continue}=	Get Element Text    	${xml}   	continue
	${obj_address}=		Get Element Text    	${xml}          address

	sleep     2s
	Click Element         ${obj_miscform}
	sleep     2s
	Click Element         ${obj_taxyear2021}
	sleep     2s
	Click Element         ${obj_manual}

  ${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   1099Misc
  ${rows}=         Get Length  ${sheet}

	${Businessdata}=       Get cell value    5    A   1099Misc
	Wait Until Element Is Enabled 		${obj_business}  		10s
	Click Element         ${obj_business}
	Wait Until Element Is Enabled 		${obj_bsearch}  		10s
	input text			${obj_bsearch}		${Businessdata}
	Wait Until Element Is Enabled 		${obj_bselect}  		10s
	Click Element         ${obj_bselect}

	${RecipientTIN}=       Get cell value    2    C   1099Misc
	${Rents}=       Get cell value    2    D   1099Misc
	
	sleep    7s
	Click Element         ${obj_recipient}
	Wait Until Element Is Enabled 		${obj_rsearch}			10s
	input text			${obj_rsearch}		${RecipientTIN}
	Wait Until Element Is Enabled 		${obj_rselect}  		10s
	Click Element         ${obj_rselect}
	input text			${obj_line1}		${Rents}
	
	Click Element         ${obj_save}
	sleep    2s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}
	
	
