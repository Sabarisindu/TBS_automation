*** Keywords ***
TBS-MISC_TS-004


	${logid}=     Get Environment Variable     logid
	Log to console       runid is ${logid}
	${xml}=    Parse XML    ../Object repository/1099Misc.xml
	${obj_business}=		Get Element Text    	${xml}   	business
	${obj_bsearch}=		Get Element Text    	${xml}   	bsearch
	${obj_bselect}=		Get Element Text    	${xml}   	bselect
	${obj_recipient}=		Get Element Text    	${xml}   	recipient
	${obj_rsearch}=		Get Element Text    	${xml}   	rsearch
	${obj_rselect}=		Get Element Text    	${xml}   	rselect
	${obj_line1}=		Get Element Text    	${xml}   	line1
	${obj_line2}=		Get Element Text    	${xml}   	line2
	${obj_line3}=		Get Element Text    	${xml}   	line3
	${obj_line4}=		Get Element Text    	${xml}   	line4
	${obj_line5}=		Get Element Text    	${xml}   	line5
	${obj_line6}=		Get Element Text    	${xml}   	line6
	${obj_line7}=		Get Element Text    	${xml}   	line7
	${obj_line8}=		Get Element Text    	${xml}   	line8
	${obj_line9}=		Get Element Text    	${xml}   	line9
	${obj_line10}=		Get Element Text    	${xml}   	line10
	${obj_line11}=		Get Element Text    	${xml}   	line11
	${obj_line12}=		Get Element Text    	${xml}   	line12
	${obj_line13}=		Get Element Text    	${xml}   	line13
	${obj_line14}=		Get Element Text    	${xml}   	line14
	${obj_save}=		Get Element Text    	${xml}   	save
	${obj_savecon}=		Get Element Text    	${xml}   	savecon
	${obj_continue}=	Get Element Text    	${xml}   	continue
	${obj_address}=		Get Element Text    	${xml}          address
	${obj_ronline}=		Get Element Text    	${xml}          ronline
	${obj_remail}=		Get Element Text    	${xml}          remail

	sleep     2s
	
  ${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   1099Misc
  ${rows}=         Get Length  ${sheet}

	${RecipientTIN}=       Get cell value    5    C   1099Misc
	${Rents}=       Get cell value    5    D   1099Misc
	${Royalties}=       Get cell value    5    E   1099Misc
	${Other}=       Get cell value    5    F   1099Misc
	${Federal}=       Get cell value    5    G   1099Misc
	${Fishing}=       Get cell value    5    H   1099Misc
	${Medical}=       Get cell value    5    I   1099Misc
	${Substitute}=       Get cell value    5    K   1099Misc
	${Crop}=       Get cell value    5    L   1099Misc
	${Gross}=       Get cell value    5    M   1099Misc
	${Fish}=       Get cell value    5    N   1099Misc
	${Section}=       Get cell value    5    O   1099Misc
	${Excess}=       Get cell value    5    P   1099Misc
	${Nonqualified}=       Get cell value    5    Q   1099Misc
	
	
	sleep    7s
	Click Element         ${obj_recipient}
	Wait Until Element Is Enabled 		${obj_rsearch}			10s
	input text			${obj_rsearch}		${RecipientTIN}
	Wait Until Element Is Enabled 		${obj_rselect}  		10s
	Click Element         ${obj_rselect}
	sleep    2s
	Click Element		${obj_ronline}
	input text			${obj_line1}		${Rents}
	press keys   	${obj_remail}        CTRL+a+BACKSPACE
	input text			${obj_remail}		udhaya.g+k1@dotnetethics.com
	Capture Page Screenshot 	${CURDIR}/Screenshot/TBS-MISC_TS-004.png
	
	Click Element         ${obj_save}
	sleep    2s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}

	
