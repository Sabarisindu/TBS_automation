*** Keywords ***
Select_Form_W-2


	${xml}=    Parse XML    W-2.xml
	${obj_w2form}=		Get Element Text    	${xml}   	w2form
	${obj_taxyear2021}=		Get Element Text    	${xml}   	taxyear2021
	${obj_manual}=		Get Element Text    	${xml}   	manual
	${obj_business}=		Get Element Text    	${xml}   	business
	${obj_bsearch}=		Get Element Text    	${xml}   	bsearch
	${obj_bselect}=		Get Element Text    	${xml}   	bselect
        ${obj_employee}=		Get Element Text    	${xml}   	employee
	${obj_esearch}=		Get Element Text    	${xml}   	esearch
	${obj_eselect}=		Get Element Text    	${xml}   	eselect
	${obj_line1}=		Get Element Text    	${xml}   	line1
	${obj_line2}=		Get Element Text    	${xml}   	line2
	${obj_line3}=		Get Element Text    	${xml}   	line3
	${obj_line4}=		Get Element Text    	${xml}   	line4
	${obj_line5}=		Get Element Text    	${xml}   	line5
	${obj_line6}=		Get Element Text    	${xml}   	line6
	${obj_line7}=		Get Element Text    	${xml}   	line7
	${obj_line8}=		Get Element Text    	${xml}   	line8
	${obj_line10}=		Get Element Text    	${xml}   	line10
	${obj_line11}=		Get Element Text    	${xml}   	line11


	${obj_statutoryemp}=		Get Element Text    	${xml}   	statutoryemp
	${obj_retirementplan}=		Get Element Text    	${xml}   	retirementplan
	${obj_thirdparty}=		Get Element Text    	${xml}   	thirdparty
	${obj_line14}=		Get Element Text    	${xml}   	line14
	${obj_save}=		Get Element Text    	${xml}   	save
	${obj_savecon}=		Get Element Text    	${xml}   	savecon
        ${obj_address}=		Get Element Text    	${xml}          address
	${obj_continue}=	Get Element Text    	${xml}   	continue
	
	sleep     5s
	Click Element         ${obj_w2form}
	sleep     5s
	Click Element         ${obj_taxyear2021}
	sleep     5s
	Click Element         ${obj_manual}

  ${wbook}=     Set Variable     Form W-2.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   W-2
  ${rows}=         Get Length  ${sheet}
  #FOR    ${i}    IN RANGE    1    ${rows}
	${Businessdata}=       Get cell value    5    A   W-2
	Wait Until Element Is Enabled 		${obj_business}  		10s
	Click Element         ${obj_business}
	Wait Until Element Is Enabled 		${obj_bsearch}  		10s
	input text			${obj_bsearch}		${Businessdata}
	Wait Until Element Is Enabled 		${obj_bselect}  		10s
	Click Element         ${obj_bselect}

  FOR     ${i}    IN RANGE    2    5
	${EmployeeSSN}=       Get cell value    ${i}    C   W-2
	${Wages}=       Get cell value    ${i}    D   W-2
	${FederalWH}=       Get cell value    ${i}    E   W-2
        ${SocialSecurityWages}=       Get cell value    ${i}    F   W-2
	${SocialSecurityWH}=       Get cell value    ${i}    G   W-2
	${Medicarewages}=       Get cell value    ${i}    H   W-2
	${MedicareWH}=       Get cell value    ${i}    I   W-2
	${SocialSecurityTips}=       Get cell value   ${i}    J   W-2
	${AllocatedTips}=       Get cell value   ${i}    K   W-2
	${Dependent}=       Get cell value    ${i}    L   W-2
	${Nonqualified}=       Get cell value    ${i}    M   W-2
	${StatutoryEmp}=	Get cell value	${i}	W   W-2
	${Retirement}=		Get cell value	${i}	X   W-2
	${Thirdparty}=		Get cell value	${i}	Y   W-2
	${Other}=	Get cell value	${i}	Z   W-2
	

	sleep    5s
	Click Element         ${obj_employee}
	Wait Until Element Is Enabled 		${obj_esearch}			10s
	input text			${obj_esearch}		${EmployeeSSN}
	Wait Until Element Is Enabled 		${obj_eselect}  		10s
	Click Element         ${obj_eselect}
	input text			${obj_line1}		${Wages}
	input text			${obj_line2}		${FederalWH}
	input text			${obj_line3}		${SocialSecurityWages}
	input text			${obj_line4}		${SocialSecurityWH}
	input text			${obj_line5}		${Medicarewages}
	input text			${obj_line6}		${MedicareWH}
	input text			${obj_line7}		${SocialSecurityTips}
	input text			${obj_line8}		${AllocatedTips}
	input text			${obj_line10}		${Dependent}
	input text			${obj_line11}		${Nonqualified}	

	${passed}=	Set Variable	If	${StatutoryEmp}==Yes
	Run Keyword If    ${passed}    Click Element   ${obj_statutoryemp}
	sleep    2s

	${passed}=	Set Variable	If	${Retirement}==Yes
	Run Keyword If    ${passed}    Click Element   ${obj_retirementplan}
	sleep    2s


	${passed}=	Set Variable	If	${Thirdparty}==Yes
	Run Keyword If    ${passed}    Click Element   ${obj_thirdparty}
	sleep    2s

	input text	${obj_line14}		${Other}
	sleep   3s

	#Click Element          ${obj_savecon}
	Run Keyword If	${i}==4  Click Element       ${obj_savecon}                                 
	  ...        ELSE           Click Element       ${obj_save}
	
	sleep   6s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}

  END
	
	

	
