*** Keywords ***
TBS-W-2_TS-004

	${xml}=    Parse XML    ../Object Repository/W-2.xml
	${logid}=     Get Environment Variable     logid
	${obj_w2form}=		fndbget      select objvalue from tb_autoobj where objname='w2form'and objpg='Form W-2'
	${obj_taxyear2021}=		fndbget      select objvalue from tb_autoobj where objname='taxyear2021'and objpg='Form W-2'
	${obj_manual}=		fndbget      select objvalue from tb_autoobj where objname='manual'and objpg='Form W-2'
	${obj_business}=		fndbget      select objvalue from tb_autoobj where objname='business'and objpg='Form W-2'
	${obj_bsearch}=		fndbget      select objvalue from tb_autoobj where objname='bsearch' and objpg='Form W-2'
	${obj_bselect}=		fndbget      select objvalue from tb_autoobj where objname='bselect'and objpg='Form W-2'
        ${obj_employee}=		fndbget      select objvalue from tb_autoobj where objname='employee'and objpg='Form W-2'
	${obj_esearch}=		fndbget      select objvalue from tb_autoobj where objname='esearch'and objpg='Form W-2'
	${obj_eselect}=		fndbget      select objvalue from tb_autoobj where objname='eselect'and objpg='Form W-2'
	${obj_onlineaccess}=		fndbget      select objvalue from tb_autoobj where objname='onlineaccess'and objpg='Form W-2'
	${obj_line1}=		fndbget      select objvalue from tb_autoobj where objname='line1'and objpg='Form W-2'
	${obj_line2}=		fndbget      select objvalue from tb_autoobj where objname='line2'and objpg='Form W-2'
	${obj_line3}=		fndbget      select objvalue from tb_autoobj where objname='line3'and objpg='Form W-2'
	${obj_line4}=		fndbget      select objvalue from tb_autoobj where objname='line4'and objpg='Form W-2'
	${obj_line5}=		fndbget      select objvalue from tb_autoobj where objname='line5'and objpg='Form W-2'
	${obj_line6}=		fndbget      select objvalue from tb_autoobj where objname='line6'and objpg='Form W-2'
	${obj_line7}=		fndbget      select objvalue from tb_autoobj where objname='line7'and objpg='Form W-2'
	${obj_line8}=		fndbget      select objvalue from tb_autoobj where objname='line8'and objpg='Form W-2'
	${obj_line10}=		fndbget      select objvalue from tb_autoobj where objname='line10'and objpg='Form W-2'
	${obj_line11}=		fndbget      select objvalue from tb_autoobj where objname='line11'and objpg='Form W-2'


	${obj_statutoryemp}=		fndbget      select objvalue from tb_autoobj where objname='statutoryemp'and objpg='Form W-2'
	${obj_retirementplan}=		fndbget      select objvalue from tb_autoobj where objname='retirementplan'and objpg='Form W-2'
	${obj_thirdparty}=		fndbget      select objvalue from tb_autoobj where objname='thirdparty'and objpg='Form W-2'
	${obj_line14}=		fndbget      select objvalue from tb_autoobj where objname='line14'and objpg='Form W-2'
	${obj_savecon}=		fndbget      select objvalue from tb_autoobj where objname='savecon'and objpg='Form W-2'
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'and objpg='Form W-2'
        ${obj_address}=		fndbget      select objvalue from tb_autoobj where objname='address'and objpg='Form W-2'
	${obj_continue}=	fndbget      select objvalue from tb_autoobj where objname='continue'and objpg='Form W-2'
	${obj_clear}=		fndbget      select objvalue from tb_autoobj where objname='clear'and objpg='Form W-2'
	${obj_emailaddress}=		fndbget      select objvalue from tb_autoobj where objname='emailaddress'and objpg='Form W-2'
	${TS_id}=       Get cell value    5    B   W-2_Scenario
	${TS_desc}=       Get cell value    5    AM   W-2_Scenario

  ${wbook}=     Set Variable     ../Test Data/Form W-2.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   W-2_Scenario
  ${rows}=         Get Length  ${sheet}
  #FOR    ${i}    IN RANGE    1    ${rows}
	${EmployeeSSN}=       Get cell value    5    C   W-2_Scenario
	${Wages}=       Get cell value    5    D   W-2_Scenario
	${FederalWH}=       Get cell value    5    E   W-2_Scenario
        ${SocialSecurityWages}=       Get cell value    5    F   W-2_Scenario
	${SocialSecurityWH}=       Get cell value    5    G   W-2_Scenario
	${Medicarewages}=       Get cell value    5    H   W-2_Scenario
	${MedicareWH}=       Get cell value    5    I   W-2_Scenario
	${SocialSecurityTips}=       Get cell value   5    J   W-2_Scenario
	${AllocatedTips}=       Get cell value   5    K   W-2_Scenario
	${Dependent}=       Get cell value    5    L   W-2_Scenario
	${Nonqualified}=       Get cell value    5    M   W-2_Scenario
	${StatutoryEmp}=	Get cell value	5	W   W-2_Scenario
	${Retirement}=		Get cell value	5	X   W-2_Scenario
	${Thirdparty}=		Get cell value	5	Y   W-2_Scenario
	${Other}=	Get cell value	5	Z   W-2_Scenario
	${obj_oaccessemail}=	Get cell value	10	A   W-2_Scenario

	Wait Until Element is Enabled	${obj_clear}	5s
	Click Element		${obj_clear}
	${Businessdata}=       Get cell value    5    A   W-2_Scenario
	Wait Until Element Is Enabled 		${obj_business}  		5s
	Click Element         ${obj_business}
	Wait Until Element Is Enabled 		${obj_bsearch}  		5s
	input text			${obj_bsearch}		${Businessdata}
	Wait Until Element Is Enabled 		${obj_bselect}  		5s
	Click Element         ${obj_bselect}
	sleep    5s
	Click Element         ${obj_employee}
	Wait Until Element Is Enabled 		${obj_esearch}			5s
	input text			${obj_esearch}		${EmployeeSSN}
	Wait Until Element Is Enabled 		${obj_eselect}  		5s
	Click Element         ${obj_eselect}
	sleep    2s
	press keys   	${obj_emailaddress}        CTRL+a+BACKSPACE	
	Input Text			${obj_emailaddress}		${obj_oaccessemail}
	Click Element         ${obj_onlineaccess}
	sleep    2s
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
	${passed4} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s	
	Click Element       ${obj_saveadd}
	sleep   6s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    5s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    5s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}
	Run Keyword 	Capture Page Screenshot     ../Support/Screenshots/${TS_id}.png
	
	Run Keyword If	${passed4}      writelog    '${logid}','${TS_id}','${TS_desc}','W-2 form should be created by opting online access','W-2 form is created by opting online access','Pass','${TS_id}.png'
	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','W-2 form should be created by opting online access','W-2 form is created by opting online access','Fail','${TS_id}.png'