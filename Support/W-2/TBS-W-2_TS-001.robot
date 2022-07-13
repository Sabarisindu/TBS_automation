*** Keywords ***
TBS-W-2_TS-001

	${xml}=    Parse XML    ../Object Repository/W-2.xml
	${logid}=     Get Environment Variable     logid
	${obj_w2form}=		fndbget      select objvalue from tb_autoobj where objname='w2form'
	${obj_taxyear2021}=		fndbget      select objvalue from tb_autoobj where objname='taxyear2021'and objpg='Form W-2'
	${obj_manual}=		fndbget      select objvalue from tb_autoobj where objname='manual'and objpg='Form W-2'
	${obj_business}=		fndbget      select objvalue from tb_autoobj where objname='business'and objpg='Form W-2'
	${obj_bsearch}=		fndbget      select objvalue from tb_autoobj where objname='bsearch' and objpg='Form W-2'
	${obj_bselect}=		fndbget      select objvalue from tb_autoobj where objname='bselect'and objpg='Form W-2'
        ${obj_employee}=		fndbget      select objvalue from tb_autoobj where objname='employee'and objpg='Form W-2'
	${obj_esearch}=		fndbget      select objvalue from tb_autoobj where objname='esearch'and objpg='Form W-2'
	${obj_eselect}=		fndbget      select objvalue from tb_autoobj where objname='eselect'and objpg='Form W-2'
	${obj_line1}=		fndbget      select objvalue from tb_autoobj where objname='line1'and objpg='Form W-2'
	${obj_savecon}=		fndbget      select objvalue from tb_autoobj where objname='savecon'and objpg='Form W-2'
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'
        ${obj_address}=		fndbget      select objvalue from tb_autoobj where objname='address'and objpg='Form W-2'
	${obj_continue}=	fndbget      select objvalue from tb_autoobj where objname='continue'and objpg='Form W-2'
	${TS_id}=       Get cell value    2    B   W-2_Scenario
	${TS_desc}=       Get cell value    2    AM   W-2_Scenario
	sleep     5s
	Click Element         ${obj_w2form}
	sleep     5s 
	Click Element         ${obj_taxyear2021}
	sleep     5s
	Click Element         ${obj_manual}

  ${wbook}=     Set Variable     ../Test Data/Form W-2.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   W-2_Scenario
  ${rows}=         Get Length  ${sheet}
  #FOR    ${i}    IN RANGE    1    ${rows}
	${Businessdata}=       Get cell value    5    A   W-2_Scenario
	Wait Until Element Is Enabled 		${obj_business}  		5s
	Click Element         ${obj_business}
	Wait Until Element Is Enabled 		${obj_bsearch}  		5s
	input text			${obj_bsearch}		${Businessdata}
	Wait Until Element Is Enabled 		${obj_bselect}  		5s
	Click Element         ${obj_bselect}
	${EmployeeSSN}=       Get cell value    2    C   W-2_Scenario
	${Wages}=       Get cell value    2    D   W-2_Scenario

	sleep    5s
	Click Element         ${obj_employee}
	Wait Until Element Is Enabled 		${obj_esearch}			5s
	input text			${obj_esearch}		${EmployeeSSN}
	Wait Until Element Is Enabled 		${obj_eselect}  		5s
	Click Element         ${obj_eselect}
	input text			${obj_line1}		${Wages}
	${passed1} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s
	Click Element       ${obj_saveadd}
	sleep   6s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    5s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    5s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}
	Run Keyword 	Capture Page Screenshot     ../Support/Screenshots/${TS_id}.png
	
	Run Keyword If	${passed1}      writelog    '${logid}','${TS_id}','${TS_desc}','W-2 form should be created with USPS address','W-2 form is created with USPS address','Pass','${TS_id}.png'
 	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','W-2 form should be created with USPS address','W-2 form is not created with USPS address','Fail','${TS_id}.png'